"use client";

import { useEffect, useState } from "react";
import { Pencil, Trash2, PackageX } from "lucide-react";
import { Button } from "@/components/ui/button";

export default function TabelaVendas() {
    const [vendas, setVendas] = useState([]);
    const [carregando, setCarregando] = useState(true);

    const [paginaAtual, setPaginaAtual] = useState(1);
    const itensPorPagina = 10;

    useEffect(() => {
        async function fetchVendas() {
            try {
                const res = await fetch("http://localhost:8080/vendas", {
                    cache: "no-store",
                    credentials: "include",
                });

                const data = await res.json();
                setVendas(data);
            } catch (error) {
                console.error("Erro ao carregar vendas:", error);
            } finally {
                setCarregando(false);
            }
        }

        fetchVendas();
    }, []);

    const totalPaginas = Math.ceil(vendas.length / itensPorPagina);
    const inicio = (paginaAtual - 1) * itensPorPagina;
    const paginaVendas = vendas.slice(inicio, inicio + itensPorPagina);

    function formatarDataBR(data) {
        return new Date(data).toLocaleDateString("pt-BR");
    }

    return (
        <div className="space-y-4">


            <div>
                <h1 className="text-4xl font-bold text-black">Vendas</h1>
                <h2 className="text-lg text-gray-600 mt-1">
                    Visualize todas as vendas realizadas nessa franquia.
                </h2>
            </div>
            {/* TABELA */}
            <div className="bg-zinc-900 rounded-xl border border-zinc-800 text-white w-full overflow-x-auto">
                <table className="w-full min-w-[900px]">

                    {/* CABEÇALHO */}
                    <thead className="bg-zinc-800">
                        <tr>
                            {[
                                { label: "ID" },
                                { label: "Funcionário" },
                                { label: "Pagamento" },
                                { label: "Valor" },
                                { label: "Status" },
                                { label: "Data" },
                            ].map((col, index) => (
                                <th
                                    key={col.label}
                                    className={`${index === 0 ? "pl-10" : "p-4"} 
                  text-left uppercase text-xs font-bold`}
                                >
                                    {col.label}
                                </th>
                            ))}


                        </tr>
                    </thead>

                    {/* CORPO */}
                    <tbody>
                        {carregando ? (
                            <tr>
                                <td colSpan="7" className="text-center p-6 text-zinc-500">
                                    Carregando...
                                </td>
                            </tr>
                        ) : paginaVendas.length === 0 ? (
                               <tr>
                <td colSpan="10">
                  <div className="flex flex-col items-center justify-center h-[40vh] text-center w-full">
                    <PackageX className="w-16 h-16 text-zinc-700 mb-4" />
                    <p className="text-xl text-zinc-300 font-semibold">
                      Nenhuma venda encontrada.
                    </p>
                    <p className="text-sm text-zinc-500 mt-1">
                     Não há registros para exibir no momento.
                    </p>
                  </div>
                </td>
              </tr>
                        ) : (
                            paginaVendas.map((v) => (
                                <tr
                                    key={v.id_venda}
                                    className="border-b border-zinc-800 hover:bg-zinc-800/50"
                                >
                                    <td className="pl-10 pr-3 py-3">{v.id_venda}</td>

                                    <td className="p-3">
                                        <p className="font-semibold">{v.funcionario}</p>
                                    </td>

                                    <td className="p-3">
                                        <span className="px-3 py-2 rounded bg-zinc-800 text-xs">
                                            {v.pagamento}
                                        </span>
                                    </td>

                                    <td className="p-3 font-bold text-white">
                                        R$ {Number(v.valor_total).toLocaleString("pt-BR")}
                                    </td>

                                    <td className="p-3 font-bold text-zinc-200">{v.status}</td>

                                    <td className="p-3 font-bold text-zinc-200">
                                        {formatarDataBR(v.data_venda)}
                                    </td>


                                </tr>
                            ))
                        )}
                    </tbody>
                </table>
            </div>

            {/* PAGINAÇÃO */}
            <div className="flex justify-end gap-3 mt-4">
                <Button
                    onClick={() => setPaginaAtual((p) => Math.max(1, p - 1))}
                    disabled={paginaAtual === 1}
                    className="bg-zinc-800 text-zinc-200 hover:bg-zinc-700"
                >
                    Anterior
                </Button>

                <Button
                    onClick={() =>
                        setPaginaAtual((p) => Math.min(totalPaginas, p + 1))
                    }
                    disabled={paginaAtual === totalPaginas}
                    className="bg-zinc-800 text-zinc-200 hover:bg-zinc-700"
                >
                    Próxima
                </Button>
            </div>
        </div>
    );
}
