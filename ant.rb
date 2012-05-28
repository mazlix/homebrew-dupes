require 'formula'

class Ant < Formula
  url 'http://apache.deathculture.net/ant/binaries/apache-ant-1.8.4-bin.tar.gz'
  homepage 'http://ant.apache.org/'
  md5 'd13be81f715c51ce3e13a7149fd92765'

  def install
    rm Dir['bin/*.{bat,cmd,dll,exe}']
    libexec.install Dir['*']

    bin.mkpath
    Dir["#{libexec}/bin/*"].each do |f|
      ln_s f, bin+File.basename(f)
    end
  end

  def test
    system "ant -version"
  end
end
