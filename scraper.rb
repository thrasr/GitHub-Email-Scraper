require 'nokogiri'
require 'open-uri'
require 'watir-webdriver'
require 'headless'

def getEmail(name='')
  headless = Headless.new
  headless.start
  browser = Watir::Browser.start 'https://github.com/' + name

  doc = Nokogiri::HTML(browser.html)

  # Search for email node with xpath
  doc.xpath("//*[contains(concat(' ', normalize-space(@class), ' '), ' email ')]").each do |link|
    puts "    " + link.content
  end
end

def getContribs(project='')
  headless = Headless.new
  headless.start
  browser = Watir::Browser.start 'https://github.com/' + project + '/graphs/contributors'

  doc = Nokogiri::HTML(browser.html)

  # Search for username node with xpath
  doc.xpath("//*[contains(concat(' ', normalize-space(@class), ' '), ' aname ')]").each do |link|
    puts "  " + link.content
    getEmail(link.content)
  end
end

def getWatchers(project='')
  headless = Headless.new
  headless.start
  browser = Watir::Browser.start 'https://github.com/' + project + '/watchers'

  doc = Nokogiri::HTML(browser.html)

  # Search for username node with xpath
  doc.xpath("//*[contains(concat(' ', normalize-space(@class), ' '), ' follow-list-name ')]/span/a").each do |link|
    puts "  " + link.content
    getEmail(link.content)
  end
end

def getStars(project='')
  headless = Headless.new
  headless.start
  browser = Watir::Browser.start 'https://github.com/' + project + '/stargazers'

  doc = Nokogiri::HTML(browser.html)

  # Search for username node with xpath
  doc.xpath("//*[contains(concat(' ', normalize-space(@class), ' '), ' follow-list-name ')]/span/a").each do |link|
    puts "  " + link.content
    getEmail(link.content)
  end
end

def getProjects(name='')
  headless = Headless.new
  headless.start
  browser = Watir::Browser.start 'https://github.com/' + name

  doc = Nokogiri::HTML(browser.html)

  # Search for repo name node with xpath
  doc.xpath("//*[contains(concat(' ', normalize-space(@class), ' '), ' org-repo-name ')]/a").each do |link|
    result = name + '/' + link.content.strip
    puts result
    getContribs(result)
    getWatchers(result)
    getStars(result)
  end
end


# TODO: Enable hash-map (python-esque dict or list)  to store names/emails.
#	Avoid checking same person multiple times.
# 	Investigate grabbing list of people who have forked the project.
#	What do with emails when done?  Write/pipe to file?

# Enables multiple groups
#ARGV.each do |a|
#  getProjects(a)
#end

getProjects(ARGV[0])
