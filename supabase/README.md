# Turn on real accounts (Supabase)

1. Go to https://supabase.com, sign in with GitHub, click **New project** (free plan). Pick a name, a database password (save it in a password manager), and the region closest to NC (East US).
2. When the project is ready: **SQL Editor** -> **New query** -> paste everything from `setup.sql` -> **Run**. You should see "Success".
3. **Authentication -> URL Configuration**: set **Site URL** to `https://pathway-api-eo5x.vercel.app` (your site).
4. **Project Settings -> API**: copy the **Project URL** and the **anon public** key. (The anon key is meant to be public. NEVER use or share the `service_role` key.)
5. Send the Project URL and the anon key to Claude (or paste them into `const SUPABASE_URL` / `const SUPABASE_ANON_KEY` in pathway-prototype.html), then push and redeploy.

Notes
- Passwords are handled by Supabase (hashed); Pathway never sees or stores them.
- Email confirmation is on by default: new users click a link in their email, then log in. For testing you can turn it off under Authentication -> Providers -> Email.
- "Forgot password" isn't built yet.
- The saved data is only roadmap choices, courses and GPA, never the transcript file.
