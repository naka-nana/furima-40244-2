document.addEventListener('DOMContentLoaded', () => {
  const dropdownToggle = document.querySelector('.dropdown-toggle');
  const dropdownMenu = document.querySelector('.dropdown-menu');
  const menuItems = dropdownMenu.querySelectorAll('li'); // メニュー内のリスト項目を取得

  if (dropdownToggle && dropdownMenu && menuItems.length > 0) {
    // カテゴリー2以降を表示
    menuItems.forEach((item, index) => {
      if (index < 1) { // カテゴリー1を非表示（index: 0）
        item.style.display = 'none';
      }
    });

    // クリック時に表示・非表示を切り替え
    dropdownToggle.addEventListener('click', (event) => {
      event.preventDefault(); // デフォルト動作を無効化
      dropdownMenu.classList.toggle('hidden');
      dropdownMenu.classList.toggle('visible');
    });

    // メニュー外をクリックしたら非表示にする
    document.addEventListener('click', (event) => {
      if (!dropdownToggle.contains(event.target) && !dropdownMenu.contains(event.target)) {
        dropdownMenu.classList.add('hidden');
        dropdownMenu.classList.remove('visible');
      }
    });
  }
});