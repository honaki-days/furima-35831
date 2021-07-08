const pay = () => {
  Payjp.setPublicKey("pk_test_bb8d59841e663e7b7cc51fba"); // PAY.JPテスト公開鍵

  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_log_address[number]"),
      cvc: formData.get("purchase_log_address[cvc]"),
      exp_month: formData.get("purchase_log_address[exp_month]"),
      exp_year: `20${formData.get("purchase_log_address[exp_year]")}`,

    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("order_number").removeAttribute("name");
      document.getElementById("order_cvc").removeAttribute("name");
      document.getElementById("order_exp_month").removeAttribute("name");
      document.getElementById("order_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);