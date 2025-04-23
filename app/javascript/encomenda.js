document.addEventListener("DOMContentLoaded", () => {
  let produtoIndex = document.querySelectorAll(".produto-line").length;

  function atualizarTotal() {
    let total = 0;
    document.querySelectorAll(".produto-line").forEach((linha) => {
      const precoTexto = linha.querySelector(".preco-unitario").innerText.replace("R$", "").replace(",", ".").trim();
      const quantidade = parseInt(linha.querySelector(".quantidade").value || "1");
      const preco = parseFloat(precoTexto) || 0;
      total += preco * quantidade;
    });
    document.getElementById("valor-total").innerText = `R$ ${total.toFixed(2).replace(".", ",")}`;
  }

  function buscarProdutoPorCodigo(input, index = null) {
    const codigo = input.value.trim();
    if (codigo.length === 0) return;

    fetch(`/produtos/buscar_por_codigo?codigo=${codigo}`)
      .then(res => {
        if (!res.ok) {
          throw new Error("Produto não encontrado");
        }
        return res.json();
      })
      .then(data => {
        const linha = input.closest(".produto-line");
        linha.querySelector(".preco-unitario").innerText = `R$ ${parseFloat(data.preco).toFixed(2).replace(".", ",")}`;

        // Atualiza ou cria o campo hidden de produto_id
        let hidden = linha.querySelector("input[name*='[produto_id]']");
        const finalIndex = index !== null ? index : Array.from(document.querySelectorAll(".produto-line")).indexOf(linha);

        if (!hidden) {
          hidden = document.createElement("input");
          hidden.type = "hidden";
          hidden.name = `encomenda[encomenda_produtos_attributes][${finalIndex}][produto_id]`;
          linha.appendChild(hidden);
        } else {
          hidden.name = `encomenda[encomenda_produtos_attributes][${finalIndex}][produto_id]`;
        }

        hidden.value = data.id;

        atualizarTotal();
      })
      .catch((error) => {
        alert(error.message);
      });
  }

  document.getElementById("add-produto").addEventListener("click", () => {
    fetch("/encomendas/novo_produto_campo")
      .then(res => res.text())
      .then(html => {
        const container = document.getElementById("produtos-container");
        container.insertAdjacentHTML("beforeend", html);

        // Pega o último campo adicionado
        const novaLinha = container.querySelector(".produto-line:last-child");
        const codigoInput = novaLinha.querySelector(".codigo-barra");
        const quantidadeInput = novaLinha.querySelector(".quantidade");

        if (codigoInput) {
          codigoInput.addEventListener("input", () => buscarProdutoPorCodigo(codigoInput, produtoIndex));
        }

        if (quantidadeInput) {
          quantidadeInput.addEventListener("input", () => atualizarTotal());
        }

        // Atualiza os names dos inputs
        novaLinha.querySelectorAll("input, select").forEach(input => {
          if (input.name) {
            input.name = input.name.replace("encomenda[encomenda_produtos_attributes][]", `encomenda[encomenda_produtos_attributes][${produtoIndex}]`);
          }
        });

        produtoIndex++;
      });
  });

  document.addEventListener("input", (event) => {
    if (event.target.classList.contains("codigo-barra")) {
      buscarProdutoPorCodigo(event.target);
    }

    if (event.target.classList.contains("quantidade")) {
      atualizarTotal();
    }
  });

  document.addEventListener("click", (event) => {
    if (event.target.classList.contains("remove-produto")) {
      event.target.closest(".produto-line").remove();
      atualizarTotal();
    }
  });

  atualizarTotal();

  // Força sincronização das quantidades antes de enviar
  document.querySelector("form").addEventListener("submit", (e) => {
    document.querySelectorAll(".produto-line").forEach((linha) => {
      const quantidadeInput = linha.querySelector(".quantidade");
      const hiddenQtd = linha.querySelector(".quantidade-oculta");

      if (quantidadeInput && hiddenQtd) {
        hiddenQtd.value = quantidadeInput.value || 1;
      }
    });
  });
});
