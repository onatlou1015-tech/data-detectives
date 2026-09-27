/* ============================================================
   Floating Bible Verse Panel — Simplified & Forced
   Usage:  <script src="bible-verse.js"></script>
   ============================================================ */

(function () {
  'use strict';

  // ---------- Verses ----------
  const VERSES = [
    { text: "For God so loved the world that he gave his one and only Son, that whoever believes in him shall not perish but have eternal life.", reference: "John 3:16" },
    { text: "I can do all this through him who gives me strength.", reference: "Philippians 4:13" },
    { text: "The Lord is my shepherd; I shall not want.", reference: "Psalm 23:1" },
    { text: "Trust in the Lord with all your heart and lean not on your own understanding.", reference: "Proverbs 3:5" },
    { text: "Be strong and courageous. Do not be afraid; do not be discouraged, for the Lord your God will be with you wherever you go.", reference: "Joshua 1:9" },
    { text: "Your word is a lamp for my feet, a light on my path.", reference: "Psalm 119:105" },
    { text: "Cast all your anxiety on him because he cares for you.", reference: "1 Peter 5:7" },
    { text: "And we know that in all things God works for the good of those who love him.", reference: "Romans 8:28" },
    { text: "The joy of the Lord is your strength.", reference: "Nehemiah 8:10" },
    { text: "Let all that you do be done in love.", reference: "1 Corinthians 16:14" }
  ];

  const ROTATE_SECONDS = 30;

  // ---------- Inject CSS ----------
  const style = document.createElement('style');
  style.textContent = `
    #floating-bible-verse {
      position: fixed !important;
      top: 20px !important;
      left: 20px !important;
      right: auto !important;
      bottom: auto !important;
      z-index: 99999 !important;
      max-width: 320px !important;
      padding: 12px 16px !important;
      border-radius: 14px !important;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif !important;
      font-size: 23px !important;
      line-height: 1.5 !important;
      background-color: #AA93B8 !important;
      color: #F3D3A7 !important;
      border: 2px solid #C88561 !important;
      box-shadow: 0 8px 20px rgba(43, 32, 24, 0.3) !important;
      text-align: left !important;
      user-select: none !important;
      display: block !important;
      visibility: visible !important;
      opacity: 1 !important;
    }

    #floating-bible-verse #verse-text {
      font-style: italic !important;
      color: #F3D3A7 !important;
      margin-bottom: 6px !important;
      display: block !important;
    }

    #floating-bible-verse #verse-reference {
      font-size: 0.95em !important;
      font-weight: 700 !important;
      text-align: right !important;
      color: #F3D3A7 !important;
      opacity: 0.9 !important;
      display: block !important;
    }

    @media (max-width: 600px) {
      #floating-bible-verse {
        font-size: 11px !important;
        max-width: 200px !important;
        padding: 8px 12px !important;
        top: 10px !important;
        left: 10px !important;
      }
    }
  `;
  document.head.appendChild(style);

  // ---------- Build Panel ----------
  function buildPanel() {
    // Remove any existing one
    const old = document.getElementById('floating-bible-verse');
    if (old) old.remove();

    const panel = document.createElement('div');
    panel.id = 'floating-bible-verse';

    const textEl = document.createElement('div');
    textEl.id = 'verse-text';

    const refEl = document.createElement('div');
    refEl.id = 'verse-reference';

    panel.appendChild(textEl);
    panel.appendChild(refEl);

    document.body.appendChild(panel);
    return { panel, textEl, refEl };
  }

  // ---------- Rotation ----------
  function start() {
    const { textEl, refEl } = buildPanel();

    let index = 0;

    function show() {
      const v = VERSES[index];
      textEl.textContent = '"' + v.text + '"';
      refEl.textContent = '— ' + v.reference;
    }

    show();

    setInterval(function () {
      index = (index + 1) % VERSES.length;
      show();
    }, ROTATE_SECONDS * 1000);
  }

  // ---------- Start when DOM is ready ----------
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', start);
  } else {
    start();
  }
})();