+++
title = "AI Blindspots"
+++

<!-- Define the CSS variable for stroke color -->
<style>
:root {
  --stroke-color: black;
}
@media (prefers-color-scheme: dark) {
  :root {
    --stroke-color: white;
  }
}
svg {
  display: block;
  margin: 0 auto;
  max-width: 400px;
  width: 100%;
  height: auto;
}
</style>

<!-- Inline SVG for the Eye of Providence -->
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200" stroke-linecap="round" stroke-linejoin="round">
  <!-- Pyramid -->
  <polygon points="30,170 170,170 100,50" fill="none" stroke="var(--stroke-color)" stroke-width="2"/>
  <!-- Closed eye: a subtle curved eyelid -->
  <path d="M70,110 Q100,100 130,110" fill="none" stroke="var(--stroke-color)" stroke-width="2"/>
  <!-- Delicate crease detail -->
  <path d="M75,112 Q100,107 125,112" fill="none" stroke="var(--stroke-color)" stroke-width="1"/>
</svg>

AIコーディング中に気づいたLLMの盲点について。Sonnetファミリーを中心に取り上げています。  もしかすると、これらの問題に対応するためのCursorルールを提案するかもしれません。

{{< recent-links >}}

This site is made with [Hugo ʕ•ᴥ•ʔ Bear](https://github.com/janraasch/hugo-bearblog/).

This page was forked from ezyang/ai-blindspots and translated for learning purposes. If you have any issues, please contact x.com/kumamotone.
