/* ============================================================
   Floating Digital Clock
   Author: Data Detectives Unit
   Usage:  <script src="digital-clock.js"></script>
   ============================================================ */

(function () {
  'use strict';

  // ---------- Configuration ----------
  const CONFIG = {
    position: 'top-right',      // 'top-right' | 'top-left' | 'top-center'
    showDate: true,             // show day + date below the time
    showSeconds: true,          // show seconds
    use12Hour: true,            // true = 12-hour (AM/PM), false = 24-hour
    backgroundColor: '#AA93B8', // purple
    textColor: '#F3D3A7',       // cream
    borderColor: '#C88561',     // brown
    shadowColor: 'rgba(43, 32, 24, 0.3)'
  };

  // ---------- Build the clock element ----------
  function createClockElement() {
    const clock = document.createElement('div');
    clock.id = 'floating-digital-clock';
    clock.setAttribute('aria-label', 'Current time');

    // Inline styles (no external CSS needed)
    Object.assign(clock.style, {
      position: 'fixed',
      zIndex: '10000',
      padding: '10px 18px',
      borderRadius: '14px',
      fontFamily: "'Segoe UI', Tahoma, Geneva, Verdana, sans-serif",
      fontWeight: '600',
      fontSize: '15px',
      letterSpacing: '1px',
      backgroundColor: CONFIG.backgroundColor,
      color: CONFIG.textColor,
      border: '2px solid ' + CONFIG.borderColor,
      boxShadow: '0 8px 20px ' + CONFIG.shadowColor,
      textAlign: 'center',
      lineHeight: '1.3',
      userSelect: 'none',
      pointerEvents: 'auto',
      transition: 'opacity 0.3s ease'
    });

    // Position
    if (CONFIG.position === 'top-right') {
      clock.style.top = '20px';
      clock.style.right = '20px';
    } else if (CONFIG.position === 'top-left') {
      clock.style.top = '20px';
      clock.style.left = '20px';
    } else if (CONFIG.position === 'top-center') {
      clock.style.top = '20px';
      clock.style.left = '50%';
      clock.style.transform = 'translateX(-50%)';
    }

    // Time line
    const timeLine = document.createElement('div');
    timeLine.id = 'clock-time';
    timeLine.style.fontSize = '1.3em';
    timeLine.style.fontWeight = '700';
    clock.appendChild(timeLine);

    // Date line
    if (CONFIG.showDate) {
      const dateLine = document.createElement('div');
      dateLine.id = 'clock-date';
      dateLine.style.fontSize = '0.75em';
      dateLine.style.marginTop = '2px';
      dateLine.style.opacity = '0.9';
      clock.appendChild(dateLine);
    }

    // Mobile responsiveness — shrink on small screens
    if (window.innerWidth < 600) {
      clock.style.fontSize = '12px';
      clock.style.padding = '8px 12px';
      clock.style.top = '10px';
      clock.style.right = '10px';
    }

    document.body.appendChild(clock);
    return clock;
  }

  // ---------- Time formatting ----------
  function pad(n) {
    return n < 10 ? '0' + n : '' + n;
  }

  function getTimeString(date) {
    let hours = date.getHours();
    const minutes = pad(date.getMinutes());
    const seconds = pad(date.getSeconds());
    let period = '';

    if (CONFIG.use12Hour) {
      period = hours >= 12 ? ' PM' : ' AM';
      hours = hours % 12;
      if (hours === 0) hours = 12;
    }

    const hh = pad(hours);
    return CONFIG.showSeconds
      ? hh + ':' + minutes + ':' + seconds + period
      : hh + ':' + minutes + period;
  }

  function getDateString(date) {
    const days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return days[date.getDay()] + ', ' + months[date.getMonth()] + ' ' + date.getDate();
  }

  // ---------- Update loop ----------
  function startClock() {
    const clock = createClockElement();
    const timeEl = document.getElementById('clock-time');
    const dateEl = document.getElementById('clock-date');

    function tick() {
      const now = new Date();
      timeEl.textContent = getTimeString(now);
      if (dateEl) {
        dateEl.textContent = getDateString(now);
      }
    }

    tick();                          // run once immediately
    setInterval(tick, 1000);         // update every second
  }

  // ---------- Auto-start ----------
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', startClock);
  } else {
    startClock();
  }
})();