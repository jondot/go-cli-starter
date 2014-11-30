BINARY = "go-cli-starter"







include FileUtils
ARCHS = [
  ['linux-arm', ''],
  ['linux-amd64',''],
  ['linux-386',''],
  ['darwin-amd64','']
]

task :dist do
  ARCHS.each do |arch, prefix|
    `rm -rf dist/#{arch}`
    `rm -rf build`
    `mkdir build`
    `mkdir -p dist/#{arch}`
    bin = go_build("build/#{BINARY}", arch)

    cd("dist/#{arch}") do
      cp "../../#{bin}", BINARY

      tarball = "#{BINARY}-#{arch}.tar.gz"
      `tar -czf #{tarball} *`
      cp tarball, "../"
    end

    `rm -rf dist/#{arch}`
    `rm -rf build`
  end
end


def go_build(label, arch)
    system({"GOOS" => arch.split('-')[0], 
          "GOARCH" => arch.split('-')[1]}, 
          "gom build -o #{label}-#{arch}")
    "#{label}-#{arch}"
end

