self: super: {
  cascadia-mono-nerd-font =
    super.callPackage ./packages/cascadia-mono-nerd-font {
      inherit (super.xorg) xorgFonts;
    };
}
