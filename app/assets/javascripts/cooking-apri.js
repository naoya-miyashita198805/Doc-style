// 'use strict';
$(function(){
  btn.addEventListener('click',() => {
    const resurts = ['カレーライス', 'ハンバーグ', 'パスタ','回鍋肉','ラーメン', '餃子', '牛丼', '麻婆豆腐','刺身','肉焼き','うどん', '唐揚げ', 'オムライス', '生姜焼き', 'サバの塩焼き'];

    // const resurts = ['大吉', '大吉', '大吉','末吉'];
    // という応報もあるがますランダムを使う
    const n = Math.floor(Math.random() * resurts.length);
    act.textContent = resurts[n];
    // act.textContent = resurts[Math.floor(Math.random() * resurts.length)];
    // 公式として覚えておく！
    // switch (n) {
    //   case 0:
    //     btn.textContent = '大吉';
    //     break;
    //   case 1:
    //     btn.textContent = '中吉';
    //     break;
    //   case 2:
    //     btn.textContent = '凶';
    //     break;
    // }
      // const n = Math.random();
      //   if (n < 0.1) {
      //     btn.textContent = '
        // 確率操作
  });
})