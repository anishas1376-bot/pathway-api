-- Run this ONCE in Supabase: SQL Editor -> New query -> paste -> Run.
-- One saved pathway per student; Row Level Security makes sure students can only touch their own row.

create table if not exists public.pathways (
  user_id    uuid primary key references auth.users(id) on delete cascade,
  data       jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.pathways enable row level security;

create policy "read own pathway"   on public.pathways for select using (auth.uid() = user_id);
create policy "insert own pathway" on public.pathways for insert with check (auth.uid() = user_id);
create policy "update own pathway" on public.pathways for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "delete own pathway" on public.pathways for delete using (auth.uid() = user_id);
