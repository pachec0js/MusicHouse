"use client";

import { Button } from "@/components/ui/button";
import { CirclePlus } from "lucide-react";

export default function FinanceiroHeader({ setOpen }) {
  return (
    <div className="flex justify-between items-center">
      <div>
        <h1 className="text-4xl font-bold text-[#003049]">
          Financeiro
        </h1>

        <h2 className="text-lg mt-1 text-[#94a3b8]">
          Acompanhe os indicadores financeiros, despesas, vendas e movimentações.
        </h2>
      </div>


      <Button
        onClick={() => setOpen(true)}
        className="bg-[#003049] hover:bg-zinc-700 text-white border border-zinc-700 p-5"
      >
        <CirclePlus /> Adicionar Despesa
      </Button>
    </div>
  );
}
