{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell rec{
  nativeBuildInputs = with pkgs;[
    pkg-config
    llvmPackages.bintools # To use lld linker
    alsa-lib.dev
    eudev
    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXi
  ];
  buildInputs = with pkgs;[
    udev
    alsaLib
    vulkan-loader
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXi # To use x11 feature
    libxkbcommon
    wayland # To use wayland feature
  ];
  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;
  AMD_VULKAN_ICD = "RADV";
}
