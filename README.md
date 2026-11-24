# Pathway advisor API (makes the AI chat work)

The AI key must never go in the website. This tiny function holds it and talks to Claude for you.

## One-time setup (about 15 minutes)
1. Get an API key: https://console.anthropic.com -> API Keys -> Create key (add a few dollars of credit; set a low monthly spend limit).
2. Put this folder on GitHub (new repo, upload the folder), or use the Vercel CLI.
3. https://vercel.com -> Add New Project -> import the repo. No build settings needed.
4. (Using OpenAI instead? Add `OPENAI_API_KEY` and, if needed, `ADVISOR_MODEL` instead.) Project Settings -> Environment Variables -> add `ANTHROPIC_API_KEY` = your key (Production). Optional: `ALLOWED_ORIGIN` = your site URL once you have one.
5. Deploy. Your endpoint is `https://YOUR-PROJECT.vercel.app/api/advisor`.
6. In `pathway-prototype.html` (and `pathway-landing.html`) find `const ADVISOR_URL = '';` and paste that URL between the quotes. Save and host the page (Vercel static or any host).

## Test it
curl -X POST https://YOUR-PROJECT.vercel.app/api/advisor -H "content-type: application/json" -d '{"question":"Does my GPA meet the minimum?","context":{"student":{"gpa":3.4},"admission":{"minimumGpa":3.5}}}'

## Cost and safety
- Each question costs a fraction of a cent. Set a spend limit in the Anthropic console.
- The function limits each visitor to 12 questions a minute and caps question/context size.
- The rules ("answer only from the data, never predict admission") are enforced here on the server, so visitors can't change them.
