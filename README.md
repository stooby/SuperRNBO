SuperRNBO
=========================
This is a collection of Max RNBO abstractions featuring rnboscript translations of SuperCollider UGen source code.

This isn't intended to be an exhaustive translation of all SuperCollider UGens, but rather a small selection of my personal favorites
to demonstrate how SuperCollider UGen DSP code can be made available in Max and all the export targets RNBO supports 
(VST3, Javascript for Web, C++, Raspberry Pi).


**[RNBO](https://rnbo.cycling74.com/)** is a library and toolchain that can take Max-like patches, export them as portable code, and directly compile that code to targets like a VST, a Max External, or a Raspberry Pi.

**[SuperCollider](https://supercollider.github.io/)** is a platform for audio synthesis and algorithmic composition, used by musicians, artists, and researchers working with sound.

Setup:
----------
- A version of Max that supports RNBO is required
- Put this repository (including the .rnbopat files) in a directory w/in your Max search path to ensure the RNBO abstractions can be loaded in your Max projects. 
