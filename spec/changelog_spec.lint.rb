SimpleCov.command_name "lint" if ENV["COVERAGE"] == "true"

require "kramdown"

RSpec.describe "Changelog" do
  subject(:changelog) do
    File.read("CHANGELOG.md")
  end

  it 'uses the simplest style for implicit links' do
    expect(changelog).not_to match(/\[([^\]]+)\]\[\]/)
  end

  it 'has definitions for all issue/pr references' do
    implicit_link_names = changelog.scan(/\[#([0-9]+)\] /).flatten.uniq
    implicit_link_names.each do |name|
      expect(changelog).to include("[##{name}]: https://github.com/activeadmin/activeadmin/pull/#{name}").or include("[##{name}]: https://github.com/activeadmin/activeadmin/issues/#{name}")
    end
  end

  it 'has definitions for users' do
    implicit_link_names = changelog.scan(/ \[@([[:alnum:]]+)\]/).flatten.uniq
    implicit_link_names.each do |name|
      expect(changelog).to include("[@#{name}]: https://github.com/#{name}")
    end
  end

  describe 'entry' do
    let(:lines) { changelog.each_line }

    subject(:entries) { lines.grep(/^\*/) }

    it 'does not end with a punctuation' do
      entries.each do |entry|
        expect(entry).not_to match(/\.$/)
      end
    end
  end

  describe 'warnings' do
    subject(:document) { Kramdown::Document.new(changelog) }

    specify { expect(document.warnings).to be_empty }
  end
end
