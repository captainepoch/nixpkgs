{ callPackage, makeFontsConf, buildFHSEnv, tiling_wm ? false }:

let
  mkStudio = opts: callPackage (import ./common.nix opts) {
    fontsConf = makeFontsConf {
      fontDirectories = [];
    };
    inherit buildFHSEnv;
    inherit tiling_wm;
  };
  stableVersion = {
    version = "2024.2.1.11"; # "Android Studio Ladybug | 2024.2.1 Patch 2"
    sha256Hash = "sha256-gfL6XacqtvavrMpKUyfeUZHhM60CcG4+5EDchli4zcM=";
  };
  betaVersion = {
    version = "2024.2.2.10"; # "Android Studio Ladybug | 2024.2.2 Beta 1"
    sha256Hash = "sha256-cDNM+23RmU5f7egCy78WtQ0xVi9Wz/s2mMi+/s7YIWM=";
  };
  latestVersion = {
    version = "2024.3.1.3"; # "Android Studio Meerkat | 2024.3.1 Canary 3"
    sha256Hash = "sha256-b6HEwHSnNm9ltrfWFepjqoxWQG5Awa3oxlBKeZKnv2g=";
  };
in {
  # Attributes are named by their corresponding release channels

  stable = mkStudio (stableVersion // {
    channel = "stable";
    pname = "android-studio";
  });

  beta = mkStudio (betaVersion // {
    channel = "beta";
    pname = "android-studio-beta";
  });

  dev = mkStudio (latestVersion // {
    channel = "dev";
    pname = "android-studio-dev";
  });

  canary = mkStudio (latestVersion // {
    channel = "canary";
    pname = "android-studio-canary";
  });
}
