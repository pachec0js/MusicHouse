"use client";

import { CartesianGrid, Line, LineChart, XAxis } from "recharts";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";

import {
  ChartConfig,
  ChartContainer,
  ChartTooltip,
  ChartTooltipContent,
} from "@/components/ui/chart";


const chartData = [
  { mes: "Jan", entradas: 12000, saidas: 8000 },
  { mes: "Fev", entradas: 15000, saidas: 9000 },
  { mes: "Mar", entradas: 17000, saidas: 11000 },
  { mes: "Abr", entradas: 14000, saidas: 10000 },
  { mes: "Mai", entradas: 19000, saidas: 13000 },
  { mes: "Jun", entradas: 21000, saidas: 15000 },
];


const chartConfig = {
  entradas: {
    label: "Entradas",
    color: "#FFFFFF",
  },
  saidas: {
    label: "Saídas",
    color: "#D3D3D3",
  },
};

export function FluxoDeCaixaComparacao() {
  return (
    <Card className="bg-[#003049] border-none text-white">
      <CardHeader>
        <CardTitle className="text-white">Entradas x Saídas</CardTitle>
        <CardDescription className="text-white/70">
          Evolução do Fluxo de Caixa — Consolidado
        </CardDescription>
      </CardHeader>

      <CardContent>
        <ChartContainer
          config={chartConfig}
          className="h-[260px] [&_text]:!fill-white [&_text]:!text-white"
        >
          <LineChart
            accessibilityLayer
            data={chartData}
            margin={{ left: 12, right: 12 }}
          >
            <CartesianGrid vertical={false} stroke="#ffffff22" />

            <XAxis
              dataKey="mes"
              tickLine={false}
              axisLine={false}
              tickMargin={8}
              tick={{ fontSize: 12 }}
            />

            <ChartTooltip
              cursor={false}
              content={<ChartTooltipContent />}
            />

            <Line
              dataKey="entradas"
              type="monotone"
              stroke="#FFFFFF"
              strokeWidth={3}
              dot={false}
            />

            <Line
              dataKey="saidas"
              type="monotone"
              stroke="#D3D3D3"
              strokeWidth={3}
              dot={false}
            />
          </LineChart>
        </ChartContainer>
      </CardContent>
    </Card>
  );
}
