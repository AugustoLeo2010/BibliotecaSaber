const menuBotao = document.querySelector("#menuBotao");
const menuLinks = document.querySelector("#menuLinks");

if (menuBotao && menuLinks) {
  menuBotao.addEventListener("click", () => {
    const aberto = menuLinks.classList.toggle("aberto");
    menuBotao.setAttribute("aria-expanded", String(aberto));
  });

  menuLinks.querySelectorAll("a").forEach((link) => {
    link.addEventListener("click", () => {
      menuLinks.classList.remove("aberto");
      menuBotao.setAttribute("aria-expanded", "false");
    });
  });
}

document.querySelectorAll("[data-copy]").forEach((botao) => {
  botao.addEventListener("click", async () => {
    const sql = botao.getAttribute("data-copy");
    try {
      await navigator.clipboard.writeText(sql);
      const textoOriginal = botao.textContent;
      botao.textContent = "Copiado!";
      setTimeout(() => {
        botao.textContent = textoOriginal;
      }, 1400);
    } catch (erro) {
      window.prompt("Copie o SQL abaixo:", sql);
    }
  });
});
