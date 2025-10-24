import React, { useState } from 'react';
import {
  ComposableMap,
  Geographies,
  Geography,
  Marker, 
} from 'react-simple-maps';

const brasilTopo = '/brasil-completo.geojson';

const BrasilMap = () => {
  //  Definir as filiais e suas coordenadas
  const [filiais, setFiliais] = useState([
    {
      id: 1,
      nome: 'Filial Acre',
      latitude: -8.775894,
      longitude: -70.3, //
      estado: 'AC',
    },
    {
      id: 2,
      nome: 'Filial Alagoas',
      latitude: -9.532392,
      longitude: -36.7, //
      estado: 'AL',
    },
    {
      id: 3,
      nome: 'Filial São Paulo',
      latitude: -23.5505,
      longitude: -46.6333,
      estado: 'SP',
    },
    {
      id: 4,
      nome: 'Filial Rio de Janeiro',
      latitude: -22.9068,
      longitude: -43.1729,
      estado: 'RJ',
    },
    {
      id: 5,
      nome: 'Filial Mato Grosso',
      latitude: -12.65,
      longitude: -55.8,
      estado: 'MT',
    },
  ]);

  return (
    <div>
      <h2>🗺️ Mapa de Filiais</h2>
      <ComposableMap
        projection="geoMercator"
        projectionConfig={{
          scale: 1000,
          center: [-55, -15], // Centraliza o mapa no Brasil
        }}
        width={1000}
        height={800}
        style={{ width: '100%', height: 'auto' }}
      >
        <Geographies geography={brasilTopo}>
          {({ geographies }) =>
            geographies.map((geo) => {
              // Verifica se o estado tem filiais usando o campo 'sigla' do GeoJSON
              const isFilial = filiais.some(
                (filial) => filial.estado === geo.properties.sigla
              );

              return (
                <Geography
                  key={geo.rsmKey}
                  geography={geo}
                  fill={isFilial ? '#008080' : '#B2D8D8'}
                  stroke="#FFFFFF"
                  strokeWidth={0.7}
                />
              );
            })
          }
        </Geographies>

        {filiais.map((filial) => (
          <Marker
            key={filial.id}
            coordinates={[filial.longitude, filial.latitude]} // [longitude, latitude] é o formato esperado
            onClick={() => alert(`Filial: ${filial.nome} (${filial.estado})`)}
            style={{
              default: { cursor: 'pointer' },
              hover: { opacity: 0.8 },
            }}
          >
            {/* O círculo que representa a filial */}
            <circle
              r={5}
              fill="#FF5722" // Laranja para as filiais
              stroke="#FFFFFF"
              strokeWidth={1.5}
            />
            {/* Opcional: Adicionar o nome da filial */}
            <text
              textAnchor="middle"
              y={-10}
              style={{ fontFamily: 'Arial', fontSize: '10px', fill: '#333' }}
            >
              {filial.estado}
            </text>
          </Marker>
        ))}
      </ComposableMap>
    </div>
  );
};

export default BrasilMap;
