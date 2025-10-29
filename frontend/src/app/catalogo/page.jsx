'use client';

import { AppSidebar } from '@/components/app-sidebar';
import { SidebarInset, SidebarProvider } from '@/components/ui/sidebar';
import Produtos from '@/components/Produtos/Produtos';
import FooterCatalogo from '@/components/FooterCatalogo/FooterCatalogo';
import SvgHype from '@/components/Produtos/svgHype';
import InputBusca from '@/components/InputBusca/InputBusca';
import CategoriaCatalogo from '@/components/CategoriaCatalogo/CategoriaCatalogo';
import { useState, useEffect } from 'react';

export default function Page() {
  const [cards, setCards] = useState([]);
  const [maisVendidos, setMaisVendidos] = useState([]);
  const [carregando, setCarregando] = useState(true);

  useEffect(() => {
    // const tipo = getCookie('funcao');
    // const token = getCookie('token');
    fetch(`http://localhost:8080/categorias`, {
      headers: {
        'Content-Type': 'application/json',
        // Authorization: `Bearer ${token}`,
      },
    })
      .then((response) => response.json())
      .then((informacao) => {
        setCards(informacao);
        setCarregando(false);
      })
      .catch((error) => console.error('Erro ao buscar produtos:', error));
  }, []);

  useEffect(() => {
    // const tipo = getCookie('funcao');
    // const token = getCookie('token');
    fetch(`http://localhost:8080/produtos/hypados`, {
      headers: {
        'Content-Type': 'application/json',
        // Authorization: `Bearer ${token}`,
      },
    })
      .then((response) => response.json())
      .then((informacao) => {
        setMaisVendidos(informacao);
        setCarregando(false);
      })
      .catch((error) => console.error('Erro ao buscar produtos:', error));
  }, []);

  return (
    <SidebarProvider>
      <AppSidebar />
      <SidebarInset className="bg-[#f3f3f3] overflow-x-hidden transition-all duration-300">
        <img
          src="/catalogo/banAtendimento.png"
          alt="Banner"
          className="w-full h-auto object-cover"
          draggable={false}
        />
        <InputBusca />

        <CategoriaCatalogo cards={cards} />

        <div className="mb-10">
          <h2 className="text-center text-2xl font-bold text-gray-800 lg:text-3xl">
            Instrumentos <span className="text-[#c1121f] ">mais hypados</span>
            <span>
              <SvgHype />
            </span>
          </h2>

          <p className="mx-auto max-w-screen-md text-center text-gray-600 md:text-lg ">
            Veja aqui nossos principais instrumentos
          </p>
        </div>

        <div className="flex flex-wrap justify-center gap-6 mb-16">
          <Produtos produtos={maisVendidos} />
        </div>

        <FooterCatalogo />
      </SidebarInset>
    </SidebarProvider>
  );
}
