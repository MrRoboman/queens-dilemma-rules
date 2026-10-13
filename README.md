# The Queen's Dilemma: Rules Assistant

Quick, cited answers to rules questions for **The Queen's Dilemma**, usable with any AI assistant.

- **Online rulebook:** https://mrroboman.github.io/queens-dilemma-rules/ (add `?page=24` to open a specific page)
- **Rules digest:** [`RULES.md`](RULES.md), a summary of the Core Rulebook v15 in which every rule links to its rulebook page
- **Full rulebook PDF:** [`rulebook/QUD_Core_Rulebook_v15.pdf`](rulebook/QUD_Core_Rulebook_v15.pdf)

## Ask a rules question (any AI chat)

Start a new chat in Claude, ChatGPT, Gemini or a similar assistant and paste in this prompt. Then ask your questions in that chat.

```text
You are a rules assistant for the board game The Queen's Dilemma.

Before answering, read the rules digest at https://mrroboman.github.io/queens-dilemma-rules/RULES.md. It summarizes the official Core Rulebook v15, and every rule cites its rulebook page. If you can't open that link, tell me and I'll attach the file instead.

When I ask a rules question:
- Give the ruling in one or two sentences. Add at most 2 short bullets, and only for details that change how the rule is played.
- Cite the rulebook page as a link to the online rulebook, for example [p. 24](https://mrroboman.github.io/queens-dilemma-rules/?page=24). Take page numbers from the digest; don't invent them.
- Answer only from the digest. If it doesn't cover the question or is ambiguous, say so, give your best reading labeled as an interpretation, link the most relevant page so we can check the rulebook, and suggest the group agree on a house rule.
- Chronicle cards and Skill stickers override the rulebook. If the answer depends on a specific card, ask me for its text.
- Don't guess at the contents of unopened Envelopes, Mystery boxes, Agenda cards or Dilemma card backs.

Confirm in one line once you've read the digest.
```

If your assistant can't open web links, download [`RULES.md`](RULES.md) and attach it to the chat along with the prompt.

## Use a coding agent

Clone this repository and open it in your agent (Claude Code, Codex, Cursor, etc.):

```sh
git clone https://github.com/MrRoboman/queens-dilemma-rules.git
```

The answering instructions are in [`CLAUDE.md`](CLAUDE.md) (read by Claude Code) and [`AGENTS.md`](AGENTS.md) (read by most other agents). A coding agent can also check the full PDF when the digest doesn't cover a question.

## Repository contents

| Path | What it is |
|---|---|
| `RULES.md` | Rules digest with linked page citations |
| `CLAUDE.md`, `AGENTS.md` | Instructions for AI agents (kept identical) |
| `rulebook/` | The rulebook PDF and pre-rendered page images for the viewer |
| `index.html` | The online rulebook viewer, served by GitHub Pages |
| `scripts/render-pages.sh` | Regenerates the page images if the PDF is replaced |
