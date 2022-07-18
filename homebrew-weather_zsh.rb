# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class HomebrewWeatherZsh < Formula
  desc "This is a weather shell script for you to check weather's info of any city you want."
  homepage ""
  url "https://github.com/Tu-Zhenzhao/homebrew-weather_zsh/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "06c877b06ee5460cea2ab8c797853fdaf44fdda00177de0554abade04c0484d1"
  license "MIT"

  depends_on "jq"

  def install
    bin.install 'weather'
    prefix.install "README.md"
    prefix.install "LICENSE"
  end
end
