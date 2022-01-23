import React, { Component } from "react";
import ReactDOM from "react-dom";
import "./index.css";
import App from "./components/App";
import registerServiceWorker from "./registerServiceWorker";

import * as Sentry from "@sentry/browser";
import { Integrations } from "@sentry/tracing";

console.log(process.env.REACT_APP_RELEASE_VERSION);
Sentry.init({
  dsn: "https://70db3072d1f14fbeb166f96bd4c5b573@o1124330.ingest.sentry.io/6162925",
  release: process.env.REACT_APP_RELEASE_VERSION,
  integrations: [new Integrations.BrowserTracing()],
  tracesSampleRate: 1.0,
});
ReactDOM.render(<App />, document.getElementById("root"));

registerServiceWorker();
