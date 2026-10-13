# The Queen's Dilemma: Rules Assistant

Quick, cited answers to rules questions for **The Queen's Dilemma**, usable with any AI assistant.

- **Online rulebook:** https://mrroboman.github.io/queens-dilemma-rules/
  - Add `?page=24` to the link to open a specific page.
  - Swipe to turn pages, double-tap to zoom into a column, and use Search to find a word.
- **Rules digest:** [`RULES.md`](RULES.md), a summary of the Core Rulebook v15 in which every rule links to its rulebook page.
- **House rulings:** [`HOUSE_RULES.md`](HOUSE_RULES.md), rulings our group has agreed on.
- **Campaign rules (⚠️ spoilers):** [`spoilers/`](spoilers/), cards and rule sheets revealed so far in our campaign.
- **Full rulebook PDF:** [`rulebook/QUD_Core_Rulebook_v15.pdf`](rulebook/QUD_Core_Rulebook_v15.pdf)

## Ask a rules question (any AI chat)

Chat assistants like Claude, ChatGPT and Gemini don't automatically follow instructions found in a repository, so start a new chat and paste in this prompt. Then ask your questions in that chat.

```text
You are a rules assistant for my group's campaign of the board game The Queen's Dilemma.

Before answering, read these three files:
1. https://raw.githubusercontent.com/MrRoboman/queens-dilemma-rules/main/HOUSE_RULES.md: rulings our group agreed on. They win over everything else.
2. https://raw.githubusercontent.com/MrRoboman/queens-dilemma-rules/main/spoilers/CAMPAIGN_RULES.md: cards and rule sheets revealed so far in our campaign. A specific card or rule sheet overrides the rulebook where they conflict.
3. https://raw.githubusercontent.com/MrRoboman/queens-dilemma-rules/main/RULES.md: a digest of the official Core Rulebook v15, where every rule cites its rulebook page.
If you can't open these links, tell me and I'll attach the files instead.

When I ask a rules question:
- Give the ruling in one or two sentences. Add at most 2 short bullets, and only for details that change how the rule is played.
- Cite your source. For the rulebook, link the page in the online rulebook, for example [p. 24](https://mrroboman.github.io/queens-dilemma-rules/?page=24), taking page numbers from the digest. For campaign content, name the card and its code. For house rulings, give the number.
- Answer only from these files. If they don't cover the question or are ambiguous, say so, give your best reading labeled as an interpretation, link the most relevant rulebook page, and suggest the group agree on a house ruling.
- If the answer depends on a card that isn't in the campaign file, ask me for its text.
- Don't guess at anything not yet revealed in our campaign, such as unopened Envelopes or Mystery boxes, other players' Agenda cards or the backs of Dilemma cards.

Confirm in one line once you've read the files.
```

If your assistant can't open web links, download the three files and attach them to the chat along with the prompt.

## Use a coding agent

Clone this repository and open it in your agent (Claude Code, Codex, Cursor, etc.):

```sh
git clone https://github.com/MrRoboman/queens-dilemma-rules.git
```

The instructions are in [`CLAUDE.md`](CLAUDE.md) (read by Claude Code) and [`AGENTS.md`](AGENTS.md) (read by most other agents). A coding agent can also check the full PDF when the digest doesn't cover a question.

## Record revealed cards

As the campaign unlocks new cards and rules, record them in `spoilers/` so every assistant knows about them. In a Claude Code session on this repository, share photos of the revealed components, give the game number, and ask Claude to record them. It transcribes them into [`spoilers/CAMPAIGN_RULES.md`](spoilers/CAMPAIGN_RULES.md) and pushes the change. See [`spoilers/README.md`](spoilers/README.md) for what to record and what to keep secret.

## Repository contents

| Path | What it is |
|---|---|
| `RULES.md` | Core rulebook digest with linked page citations |
| `HOUSE_RULES.md` | Rulings our group has agreed on |
| `spoilers/` | ⚠️ Campaign content revealed so far, with reference photos |
| `CLAUDE.md`, `AGENTS.md` | Instructions for AI agents (kept identical) |
| `rulebook/` | The rulebook PDF, plus page images and search text for the viewer |
| `index.html` | The online rulebook viewer, served by GitHub Pages |
| `scripts/render-pages.sh` | Regenerates the viewer's page images and search text if the PDF is replaced |
