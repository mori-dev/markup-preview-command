# -*- coding: utf-8 -*-
require 'markup-preview-command'
require File.join(File.dirname(__FILE__), "spec_helper")

describe "markup-preview command" do

  let(:command) { File.join(File.dirname(__FILE__), "..", "bin", "markup-preview") }

  context "Markdown file" do
    let(:fixture_file) { File.join(File.dirname(__FILE__), "fixtures", "test.md") }
    it "convert to html" do
      @stdout = capture(:stdout) do
        puts `"#{command}" -f "#{fixture_file}"`
      end
      @stdout.should include "<h1>title</h1>"
    end
  end

  context "reStructuredText file" do
    let(:fixture_file) { File.join(File.dirname(__FILE__), "fixtures", "test.rst") }
    it "convert to html" do
      @stdout = capture(:stdout) do
        puts `"#{command}" -f "#{fixture_file}"`
      end
      @stdout.should include "<h1>title</h1>"
    end
  end

  context "Textile file" do
    let(:fixture_file) { File.join(File.dirname(__FILE__), "fixtures", "test.textile") }
    it "convert to html" do
      @stdout = capture(:stdout) do
        puts `"#{command}" -f "#{fixture_file}"`
      end
      @stdout.should include "<h1>title</h1>"
    end
  end

  context "Textile file" do
    let(:fixture_file) { File.join(File.dirname(__FILE__), "fixtures", "test.textile") }
    it "convert to html" do
      @stdout = capture(:stdout) do
        puts `"#{command}" -f "#{fixture_file}"`
      end
      @stdout.should include "<h1>title</h1>"
    end
  end

  context "Org file" do
    let(:fixture_file) { File.join(File.dirname(__FILE__), "fixtures", "test.org") }
    it "convert to html" do
      @stdout = capture(:stdout) do
        puts `"#{command}" -f "#{fixture_file}"`
      end
      @stdout.should include %Q[<h1 class="title">title</h1>]
    end
  end

  context "RDoc file" do
    let(:fixture_file) { File.join(File.dirname(__FILE__), "fixtures", "test.rdoc") }
    it "convert to html" do
      @stdout = capture(:stdout) do
        puts `"#{command}" -f "#{fixture_file}"`
      end
      @stdout.should include "<h1>title</h1>"
    end
  end
end
