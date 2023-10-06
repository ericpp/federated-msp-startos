import fs from 'fs';
import crypto from 'crypto';
import bcrypt from 'bcrypt';
import dotenv from 'dotenv';
import path from 'path';
import YAML from 'yaml'

dotenv.config();

// generate secret key
const secretKey = crypto.randomBytes(32).toString('hex');
let envContent = `SECRET_KEY=${secretKey}\n`;

// generate credentials path
const currentDir = process.cwd();
const credentialsPath = path.resolve('/data/', 'credentials.json');

const filePath = credentialsPath;
envContent += `CREDENTIALS_PATH=${credentialsPath.replace(/\\/g, '\\\\')}\n`;

// Write to .env file
fs.writeFileSync('.env', envContent);

// open the startos config file
const file = fs.readFileSync('/data/start9/config.yaml', 'utf8');
const config = YAML.parse(file);

// write the credentials file
const saltRounds = 10;
const hashedPassword = await bcrypt.hash(config.password, saltRounds);
fs.writeFileSync(filePath, JSON.stringify({ username: config.username, hashedPassword }));