"use client";

import * as React from "react";
import { Area, AreaChart, CartesianGrid, XAxis } from "recharts";

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
  ChartLegend,
  ChartLegendContent,
  ChartTooltip,
  ChartTooltipContent,
} from "@/components/ui/chart";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";

export const description = "An interactive area chart";

// -------------------------------
// 🔥 DADOS GERADOS AUTOMATICAMENTE COM DATAS REAIS
// -------------------------------
const chartData = Array.from({ length: 30 }).map((_, i) => {
  const date = new Date();
  date.setDate(date.getDate() - (29 - i)); // últimos 30 dias

  return {
    date: date.toISOString().split("T")[0],
    desktop: Math.floor(Math.random() * 300) + 100,
    mobile: Math.floor(Math.random() * 300) + 100,
  };
});

const chartConfig = {
  
  desktop: {
    label: "Desktop",
    color: "var(--chart-1)",
  },
};

export function GraficoVendasDiariasFilial() {
  const [timeRange, setTimeRange] = React.useState("daily");

  const filteredData = React.useMemo(() => {
    const now = new Date();
    let startDate;

    switch (timeRange) {
      case "monthly":
        startDate = new Date(now);
        startDate.setMonth(startDate.getMonth() - 1);
        break;
      case "annual":
        startDate = new Date(now);
        startDate.setFullYear(startDate.getFullYear() - 1);
        break;
      default:
        startDate = new Date(now);
        startDate.setDate(startDate.getDate() - 7);
        break;
    }

    return chartData.filter((item) => new Date(item.date) >= startDate);
  }, [timeRange]);

  return (
    <Card className="pt-0 bg-zinc-900 text-white">
      <CardHeader className="flex items-center gap-2 space-y-0 border-b py-5 sm:flex-row">
        <div className="grid flex-1 gap-1">
          <CardTitle className="mt-1">Faturamento Consolidado</CardTitle>
          <CardDescription className="text-zinc-400">
            Exibição do total de vendas para o período selecionado.
          </CardDescription>
        </div>

        <Select value={timeRange} onValueChange={setTimeRange}>
          <SelectTrigger
            className="hidden w-[160px] rounded-lg sm:ml-auto sm:flex bg-white text-black"
            aria-label="Select a value"
          >
            <SelectValue placeholder="Select period" />
          </SelectTrigger>
          <SelectContent className="rounded-xl">
            <SelectItem
              value="daily"
              className="rounded-lg data-[highlighted]:bg-[#003049] data-[highlighted]:text-white"
            >
              Vendas diárias
            </SelectItem>
            <SelectItem
              value="monthly"
              className="rounded-lg data-[highlighted]:bg-[#003049] data-[highlighted]:text-white"
            >
              Vendas mensais
            </SelectItem>
            <SelectItem
              value="annual"
              className="rounded-lg data-[highlighted]:bg-[#003049] data-[highlighted]:text-white"
            >
              Vendas anuais
            </SelectItem>
          </SelectContent>
        </Select>
      </CardHeader>

      <CardContent className="px-2 pt-4 sm:px-6 sm:pt-6">
        <ChartContainer
          config={chartConfig}
          className="aspect-auto h-[250px] w-full"
        >
          <AreaChart data={filteredData}>
            <defs>
              <linearGradient id="fillDesktop" x1="0" y1="0" x2="0" y2="1">
                <stop offset="5%" stopColor="#6C6C6C" stopOpacity={0.5} />
                <stop offset="95%" stopColor="#6C6C6C" stopOpacity={0.1} />
              </linearGradient>

              <linearGradient id="fillMobile" x1="0" y1="0" x2="0" y2="1">
                <stop offset="5%" stopColor="#D3D3D3" stopOpacity={0.5} />
                <stop offset="95%" stopColor="#D3D3D3" stopOpacity={0.1} />
              </linearGradient>
            </defs>

            <CartesianGrid vertical={false} stroke="#444444" />

            <XAxis
              dataKey="date"
              tickLine={false}
              axisLine={false}
              tickMargin={8}
              minTickGap={32}
              tickFormatter={(value) => {
                const date = new Date(value);
                return date.toLocaleDateString("pt-BR", {
                  day: "2-digit",
                  month: "short",
                });
              }}
              tick={{ fill: "#FFFFFF" }}
            />

            <ChartTooltip
              cursor={false}
              content={
                <ChartTooltipContent
                  labelFormatter={(value) => {
                    return new Date(value).toLocaleDateString("pt-BR", {
                      day: "2-digit",
                      month: "short",
                    });
                  }}
                  indicator="dot"
                />
              }
            />

            <Area
              dataKey="mobile"
              type="natural"
              fill="url(#fillMobile)"
              stroke="#D3D3D3"
              stackId="a"
            />
            <Area
              dataKey="desktop"
              type="natural"
              fill="url(#fillDesktop)"
              stroke="#6C6C6C"
              stackId="a"
            />

            <ChartLegend content={<ChartLegendContent />} />
          </AreaChart>
        </ChartContainer>
      </CardContent>
    </Card>
  );
}
