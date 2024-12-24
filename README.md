# Mozilla Readability Parser MCP Server

[![smithery badge](https://smithery.ai/badge/server-moz-readability)](https://smithery.ai/server/server-moz-readability)

An [model context protocol (MCP)](https://github.com/modelcontextprotocol) server that extracts and transforms webpage content into clean, LLM-optimized Markdown. Returns article title, main content, excerpt, byline and site name. Uses [Mozilla's Readability algorithm](https://github.com/mozilla/readability) to remove ads, navigation, footers and non-essential elements while preserving the core content structure. [More about MCP](https://modelcontextprotocol.io/introduction).

## Features
- Removes ads, navigation, footers and other non-essential content
- Converts clean HTML into well-formatted Markdown (also uses Turndown)
- Returns article metadata (title, excerpt, byline, site name)
- Handles errors gracefully

## Why Not Just Fetch?
Unlike simple fetch requests, this server:
- Extracts only relevant content using Mozilla's Readability algorithm
- Eliminates noise like ads, popups, and navigation menus
- Reduces token usage by removing unnecessary HTML/CSS
- Provides consistent Markdown formatting for better LLM processing
- Includes useful metadata about the content

## Installation

### Installing via Smithery

To install Mozilla Readability Parser for Claude Desktop automatically via [Smithery](https://smithery.ai/server/server-moz-readability):

```bash
npx -y @smithery/cli install server-moz-readability --client claude
```

### Manual Installation
```bash
npm install server-moz-readability
```

## Tool Reference

### `parse`
Fetches and transforms webpage content into clean Markdown.

**Arguments:**
```json
{
  "url": {
    "type": "string",
    "description": "The website URL to parse",
    "required": true
  }
}
```

**Returns:**
```json
{
  "title": "Article title",
  "content": "Markdown content...",
  "metadata": {
    "excerpt": "Brief summary",
    "byline": "Author information",
    "siteName": "Source website name"
  }
}
```

## Usage with Claude Desktop
Add to your `claude_desktop_config.json`:
```json
{
  "mcpServers": {
    "readability": {
      "command": "npx",
      "args": ["-y", "server-moz-readability"]
    }
  }
}
```

## Dependencies
- @mozilla/readability - Content extraction
- turndown - HTML to Markdown conversion
- jsdom - DOM parsing
- axios - HTTP requests

## License
MIT
