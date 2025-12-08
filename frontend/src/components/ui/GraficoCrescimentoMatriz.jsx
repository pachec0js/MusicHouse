"use client";

import { LineChart, Line, XAxis, YAxis, Tooltip, ResponsiveContainer } from "recharts";
import { Card, CardHeader, CardTitle, CardDescription, CardContent } from "@/components/ui/card";

const data = [
  { date: "1 de abr.", value: 200 },
  { date: "2 de abr.", value: 450 },
  { date: "3 de abr.", value: 820 },
  { date: "4 de abr.", value: 1200 },
  { date: "5 de abr.", value: 1350 },
  { date: "6 de abr.", value: 1600 },
  { date: "7 de abr.", value: 1800 },
  { date: "8 de abr.", value: 1900 },
  { date: "9 de abr.", value: 2100 },
  { date: "10 de abr.", value: 2200 },
];

export default function GraficoCrescimentoMatriz() {
  return (
    <Card className="bg-[#002A42] text-white rounded-2xl p-6 w-full">
      {/* Cabeçalho: título à esquerda e total à direita */}
      <div className="flex justify-between items-center w-full">
        <div>
          <CardTitle className="text-xl font-semibold">
            Indicador de Crescimento
          </CardTitle>
          <CardDescription className="text-gray-300">
            Evolução diária consolidada
          </CardDescription>
        </div>

        <div className="text-right">
          <p className="text-gray-300 text-sm">Crescimento Total</p>
          <p className="text-4xl font-bold">2122</p>
        </div>
      </div>

      <CardContent className="h-[300px]">
        <ResponsiveContainer width="100%" height="100%">
          <LineChart data={data}>
            <XAxis 
              dataKey="date" 
              stroke="#FFFFFF" 
              tick={{ fill: "#FFFFFF", fontSize: 12, fontWeight: 600 }} 
              tickLine={false}
              axisLine={false}
              interval={0}  // Mostrar todas as datas
              textAnchor="start"
              padding={{ left: 20, right: 20 }}  // Ajustando o padding para dar mais espaço às datas
            />
            <YAxis hide />
            <Tooltip 
              contentStyle={{
                background: "#003653",
                border: "none",
                borderRadius: "10px",
              }}
              labelStyle={{ color: "#fff" }}
              itemStyle={{ color: "#fff" }}
            />
            <Line 
              type="monotone" 
              dataKey="value" 
              stroke="#FFFFFF" 
              strokeWidth={3} 
              dot={false} 
            />
          </LineChart>
        </ResponsiveContainer>
      </CardContent>
    </Card>
  );
}
