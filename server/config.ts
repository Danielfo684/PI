import dotenv from 'dotenv';
dotenv.config();

interface Config {
  port: number;
  clientUrl: string;
}

const config: Config = {
  port: parseInt(process.env.PORT || '5000', 10),
  clientUrl: process.env.CLIENT_URL || 'http://localhost:5173'
};

export default config;