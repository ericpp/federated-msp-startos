// To utilize the default config system built, this file is required. It defines the *structure* of the configuration file. These structured options display as changeable UI elements within the "Config" section of the service details page in the StartOS UI.

import { compat, types as T } from "../deps.ts";

export const getConfig: T.ExpectedExports.getConfig = compat.getConfig({
  "username": {
    "type": "string",
    "name": "Username",
    "description": "Enter the username you want to use",
    "nullable": false,
    "copyable": true,
    "masked": false,
    "default": "admin"
  },
  "password": {
    "type": "string",
    "name": "Password",
    "description": "Enter the password you want to use",
    "nullable": false,
    "copyable": true,
    "masked": true,
    "default": {
      "charset": "a-z,A-Z,0-9",
      "len": 22
    }
  }
});