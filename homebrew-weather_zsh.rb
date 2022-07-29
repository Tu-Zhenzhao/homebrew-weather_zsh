# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class HomebrewWeatherZsh < Formula
  desc "This is a weather shell script for you to check weather's info of any city you want."
  homepage ""
  url "https://github.com/Tu-Zhenzhao/homebrew-weather_zsh/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "91f2a7f2f8dee3ba485ede1fcf30e3a593b2231a10ef06414483f4afc99c82e7"
  license "MIT"

  depends_on "jq"

  def install
    bin.install 'weather'
    prefix.install "README.md"
    prefix.install "LICENSE"
  end

end
