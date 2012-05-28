require 'formula'

class Ant < Formula
  url 'http://apache.deathculture.net/ant/binaries/apache-ant-1.8.4-bin.tar.gz'
  homepage 'http://ant.apache.org/'
  md5 'f5975145d90efbbafdcabece600f716b'

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
