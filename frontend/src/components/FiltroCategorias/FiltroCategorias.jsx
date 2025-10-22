"use client";
import { useState } from "react";
import { SlidersHorizontal } from "lucide-react";
import dynamic from "next/dynamic";

// importa o Select só no cliente (sem SSR)
const Select = dynamic(() => import("react-select"), { ssr: false });

export default function FiltroCategorias() {
  const [isOpen, setIsOpen] = useState(false);

  // estados dos filtros
  const [cordas, setCordas] = useState(null);
  const [cor, setCor] = useState(null);
  const [material, setMaterial] = useState("");

  const cores = [
    { nome: "Azul Escuro", cor: "#002f46" },
    { nome: "Marrom", cor: "#784421" },
    { nome: "Preto", cor: "#1a0e0e" },
  ];

  const quantidades = [4, 5, 6, 7, 12];

  const options = [
    { value: "", label: "Selecione" },
    { value: "madeira", label: "Madeira" },
    { value: "nylon", label: "Nylon" },
    { value: "aço", label: "Aço" },
    { value: "fibra", label: "Fibra de carbono" },
  ];

  const customStyles = {
    control: (provided, state) => ({
      ...provided,
      backgroundColor: "#fff",
      borderColor: state.isFocused ? "#c1121f" : "#d1d5db",
      borderRadius: "0.5rem",
      padding: "2px",
      boxShadow: state.isFocused ? "0 0 0 2px rgba(193,18,31,0.2)" : "none",
      transition: "all 0.2s ease",
      "&:hover": {
        borderColor: "#c1121f",
      },
    }),
    menu: (provided) => ({
      ...provided,
      borderRadius: "0.5rem",
      overflow: "hidden",
      boxShadow: "0 4px 12px rgba(0,0,0,0.1)",
      zIndex: 50,
    }),
    option: (provided, state) => ({
      ...provided,
      backgroundColor: state.isSelected
        ? "#c1121f"
        : state.isFocused
        ? "#fbeaec"
        : "#fff",
      color: state.isSelected ? "#fff" : "#111",
      cursor: "pointer",
      transition: "all 0.1s ease",
    }),
    singleValue: (provided) => ({
      ...provided,
      color: "#111",
    }),
    placeholder: (provided) => ({
      ...provided,
      color: "#9ca3af",
    }),
  };

  return (
    <>
      {/* Botão para abrir drawer */}
      <button
        onClick={() => setIsOpen(true)}
        className="ml-2 bg-white text-[#c1121f] p-5 rounded-lg border border-transparent focus:outline-none focus:ring-2 focus:ring-[#c1121f]/60 hover:ring-2 hover:ring-[#c1121f]/40 hover:shadow-[0_0_12px_2px_rgba(193,18,31,0.3)] hover:bg-white hover:text-[#780000] transition-all duration-300"
      >
        <SlidersHorizontal className="w-4 h-4" />
      </button>

      {/* Drawer lateral à direita */}
      <div
        className={`fixed top-0 right-0 z-40 w-full max-w-xs h-screen p-6 bg-white dark:bg-gray-800 shadow-lg transition-transform duration-300 ${
          isOpen ? "translate-x-0" : "translate-x-full"
        }`}
      >
        {/* Cabeçalho */}
        <div className="flex justify-between items-center mb-6">
          <h2 className="text-2xl font-bold text-[#c1121f]">
            Filtrar produtos
          </h2>
          <button
            onClick={() => setIsOpen(false)}
            className="text-gray-400 hover:text-gray-900 dark:hover:text-white"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
              strokeWidth={2}
              stroke="currentColor"
              className="w-6 h-6"
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                d="M6 18L18 6M6 6l12 12"
              />
            </svg>
          </button>
        </div>

        {/* FORMULÁRIO */}
        <form className="flex flex-col gap-6">
          {/* === COR === */}
          <div>
            <h3 className="text-gray-800 dark:text-gray-100 font-semibold mb-3">
              Escolha a cor
            </h3>
            <div className="flex gap-3">
              {cores.map((c, i) => (
                <button
                  key={i}
                  type="button"
                  onClick={() => setCor(c.nome)}
                  style={{ backgroundColor: c.cor }}
                  className={`w-8 h-8 rounded-full border-2 ${
                    cor === c.nome
                      ? "border-[#c1121f]"
                      : "border-transparent"
                  } transition-all`}
                />
              ))}
            </div>
          </div>

          {/* === QUANTIDADE DE CORDAS === */}
          <div>
            <h3 className="text-gray-800 dark:text-gray-100 font-semibold mb-3">
              Escolha a quantidade de cordas
            </h3>
            <div className="flex flex-wrap gap-3">
              {quantidades.map((qtd) => (
                <button
                  key={qtd}
                  type="button"
                  onClick={() => setCordas(qtd)}
                  className={`px-5 py-2.5 rounded-full font-semibold border transition-all ${
                    cordas === qtd
                      ? "bg-[#c1121f] text-white border-[#c1121f]"
                      : "bg-gray-100 text-gray-700 border-gray-200 hover:bg-gray-200"
                  }`}
                >
                  {qtd}
                </button>
              ))}
            </div>
          </div>

          {/* === MATERIAL === */}
          <div>
            <h3 className="text-gray-800 dark:text-gray-100 font-semibold mb-3">
              Material
            </h3>
            <div className="w-full">
              <Select
                options={options}
                value={options.find((opt) => opt.value === material)}
                onChange={(selected) =>
                  setMaterial(selected?.value || "")
                }
                styles={customStyles}
                placeholder="Selecione o material"
                classNamePrefix="react-select"
              />
            </div>
          </div>

          {/* BOTÕES */}
          <div className="flex gap-3 mt-8">
            <button
              type="submit"
              className="flex-1 text-white bg-[#c1121f] hover:bg-[#780000] font-medium rounded-lg text-sm px-5 py-2.5 transition-all duration-300"
            >
              Aplicar
            </button>
            <button
              type="reset"
              onClick={() => {
                setCordas(null);
                setCor(null);
                setMaterial("");
              }}
              className="flex-1 text-[#c1121f] border border-[#c1121f] hover:bg-[#c1121f] hover:text-white font-medium rounded-lg text-sm px-5 py-2.5 transition-all duration-300"
            >
              Limpar
            </button>
          </div>
        </form>
      </div>
    </>
  );
}
