# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class HomebrewWeatherZsh < Formula
  desc "This is a weather shell script for you to check weather's info of any city you want."
  homepage ""
  url "https://github.com/Tu-Zhenzhao/homebrew-weather_zsh/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "886db6345e7d63feec84fb01dddcc466ad94e4d03dd4ae7e9bcdf04a7501fb01"
  license "MIT"

  depends_on "jq"

  def install
    bin.install 'weather'
    prefix.install "README.md"
    prefix.install "LICENSE"
  end




end
