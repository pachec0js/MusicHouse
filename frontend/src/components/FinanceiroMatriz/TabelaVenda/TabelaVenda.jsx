"use client";

import { useEffect, useState, useMemo } from "react";
import { Button } from "@/components/ui/button";

export default function TabelaVendasFiliais() {
    const [vendas, setVendas] = useState([]);
    const [carregando, setCarregando] = useState(true);
    const [paginaAtual, setPaginaAtual] = useState(1);
    const itensPorPagina = 10;

    // ================== CARREGAR VENDAS ==================
    useEffect(() => {
        async function buscarVendas() {
            try {
                const res = await fetch("http://localhost:8080/vendas/geral", {
                    cache: "no-store",
                    credentials: "include",
                });

                const data = await res.json();
                setVendas(data || []);
            } catch (error) {
                console.error("Erro ao carregar vendas:", error);
            } finally {
                setCarregando(false);
            }
        }

        buscarVendas();
    }, []);

    // ================== PAGINAÇÃO (hook deve vir ANTES de qualquer return) ==================
    const totalPaginas = Math.ceil(vendas.length / itensPorPagina);
    const inicio = (paginaAtual - 1) * itensPorPagina;

    const vendasPagina = useMemo(() => {
        return vendas.slice(inicio, inicio + itensPorPagina);
    }, [vendas, paginaAtual]);

    // ================== FORMATADORES ==================
    function formatarData(data) {
        if (!data) return "-";
        const d = new Date(data);
        return d.toLocaleString("pt-BR");
    }

    function formatarMoeda(valor) {
        return Number(valor).toFixed(2).replace(".", ",");
    }

    // ================== RETURN ==================
    if (carregando) {
        return (
            <div className="bg-[#003049] rounded-xl border border-zinc-800 text-white w-full my-4 p-6 animate-pulse">
                Carregando vendas...
            </div>
        );
    }

    return (
        <div className="space-y-6">



            <div>
                <h1 className="text-4xl font-bold text-[#003049]">
                    Vendas Filiais
                </h1>

                <h2 className="text-lg mt-1 text-[#94a3b8]">
                    Acompanhe todas as vendas realizadas pelas filiais
                </h2>
            </div>


            <div className="bg-[#003049] rounded-xl border border-zinc-800 text-white w-full overflow-x-auto mt-4">
                <table className="w-full min-w-[900px]">

                    <thead className="bg-[#00263a]">
                        <tr>
                            <th className="pl-10 p-4 text-left uppercase text-xs font-bold">ID Venda</th>
                            <th className="p-4 text-left uppercase text-xs font-bold">Filial</th>
                            <th className="p-4 text-left uppercase text-xs font-bold">Funcionário</th>
                            <th className="p-4 text-left uppercase text-xs font-bold">Pagamento</th>
                            <th className="p-4 text-left uppercase text-xs font-bold">Valor Total</th>
                            <th className="p-4 text-left uppercase text-xs font-bold">Data</th>
                        </tr>
                    </thead>

                    <tbody>
                        {vendasPagina.length ? (
                            vendasPagina.map((v) => (
                                <tr
                                    key={v.id_venda}
                                    className="border-b border-zinc-800 hover:bg-zinc-800/50"
                                >
                                    <td className="pl-10 pr-3 py-3">{v.id_venda}</td>
                                    <td className="p-3 font-semibold">{v.franquia || "—"}</td>
                                    <td className="p-3 font-semibold">{v.funcionario || "—"}</td>
                                    <td className="p-3">
                                        <span className="px-3 py-2 rounded bg-[#00263a] text-xs capitalize">
                                            {v.pagamento}
                                        </span>
                                    </td>
                                    <td className="p-3 font-bold text-white">R$ {formatarMoeda(v.valor_total)}</td>
                                    <td className="p-3 font-bold text-zinc-200">{formatarData(v.data_venda)}</td>
                                </tr>
                            ))
                        ) : (
                            <tr>
                                <td colSpan="6" className="text-center p-6 text-zinc-400">
                                    Nenhuma venda encontrada
                                </td>
                            </tr>
                        )}
                    </tbody>
                </table>
            </div>

            <div className="flex justify-end gap-3 mt-4">
                <Button
                    onClick={() => setPaginaAtual((p) => Math.max(1, p - 1))}
                    disabled={paginaAtual === 1}
                    className="
      bg-[#003049] 
      text-white 
      border border-[#00263a] 
      hover:bg-[#00263a] 
      disabled:opacity-40 
      disabled:cursor-not-allowed
    "
                >
                    Anterior
                </Button>

                <Button
                    onClick={() => setPaginaAtual((p) => Math.min(totalPaginas, p + 1))}
                    disabled={paginaAtual === totalPaginas}
                    className="
      bg-[#003049] 
      text-white 
      border border-[#00263a] 
      hover:bg-[#00263a] 
      disabled:opacity-40 
      disabled:cursor-not-allowed
    "
                >
                    Próxima
                </Button>
            </div>


        </div>
    );
}
