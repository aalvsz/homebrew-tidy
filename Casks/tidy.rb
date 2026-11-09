cask "tidy" do
  version "0.1.0"
  sha256 "683e81b7569fef53b323041b9f4c273e6251487987656375c66fd61ec5180dc1"

  url "https://github.com/aalvsz/tidy/releases/download/v#{version}/Tidy.zip"
  name "Tidy"
  desc "Menu bar app showing what drains your battery, memory and disk"
  homepage "https://github.com/aalvsz/tidy"

  depends_on macos: ">= :sonoma"

  app "Tidy.app"

  # The app is ad-hoc signed, not notarized, so clear the download quarantine flag.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Tidy.app"]
  end

  zap trash: "~/Library/Preferences/local.tidy.menubar.plist"
end
