#! /usr/bin/env ruby

require "json"

class TestAndCommit
  def initialize()
    @dir = Dir.pwd
    @day = @dir[%r!/(\d+)$!, 1]
    fail "Current directory must be a number between 1 and 25!" unless @day && (0..25) === @day.to_i
  end

  def run
    run_rspec
    exit unless $?.success?
    if added_specs.any?
      puts ">>> Yay, new specs pass! Committing and pushing:\n#{commitmsg}"
      commit_and_push
    else
      puts ">>> Skipping commit since there are no new specs."
    end
  end

  def run_rspec
    system "bundle exec rspec --order defined ."
  end

  def commit_and_push
    update_json_output
    git_add
    git_commit
    git_push_in_background
  end

  def update_json_output
    json = JSON.load(new_output)
    json["examples"].each { |ex| ex.delete("run_time") }
    json["summary"].delete("duration")
    File.write(json_file, json.to_json)
  end

  def git_add
    system "git add . #{json_file}"
  end

  def git_commit
    File.write("../.commitmsg", commitmsg)
    system "git commit -F ../.commitmsg -q"
  end

  def git_push_in_background
    system "git push -q origin &"
  end

  def added_specs
    new_specs - old_specs
  end

  def removed_specs
    old_specs - new_specs
  end

  def new_specs
    @new_specs ||= descriptions_from_output(new_output)
  end

  def new_output
    @new_output ||= %x{bundle exec rspec --order defined --format json .}
  end

  def old_specs
    @old_specs ||= begin
      if File.exists?(json_file)
        descriptions_from_output(File.read(json_file))
      else
        []
      end
    end
  end

  def descriptions_from_output(json_string)
    JSON
    .load(json_string)["examples"]
    .reject { |ex| ex["status"] == "pending" }
    .map { |ex| ex["full_description"] }
  end

  def commitmsg
    lines = added_specs.map { |s| "[ADD] #{s}" } + [""] + removed_specs.map { |s| "[DEL] #{s}" }
    "Day #{@day}: #{lines.join("\n")}"
  end

  def json_file
    "../json/#{@day}.json"
  end
end

if __FILE__ == $0
  TestAndCommit.new().run
end
