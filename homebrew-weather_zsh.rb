# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class HomebrewWeatherZsh < Formula
  desc "This is a weather shell script for you to check weather's info of any city you want."
  homepage ""
  url "https://github.com/Tu-Zhenzhao/homebrew-weather_zsh/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "74a30d39231ec7018455d900bbe181b9bf2f5c7809a9bef77432b2e6fd0daeab"
  license "MIT"

  depends_on "jq"

  def install
    bin.install 'weather'
    prefix.install "README.md"
    prefix.install "LICENSE"
  end
end
