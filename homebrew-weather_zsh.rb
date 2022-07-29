# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class HomebrewWeatherZsh < Formula
  desc "This is a weather shell script for you to check weather's info of any city you want."
  homepage ""
  url "https://github.com/Tu-Zhenzhao/homebrew-weather_zsh/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "00cd9f68a0d2418ccee028cac82d0e9f0f8de20af547dde8fd87a3d7daad53a3"
  license "MIT"

  depends_on "jq"

  def install
    bin.install 'weather'
    prefix.install "README.md"
    prefix.install "LICENSE"
  end
end
