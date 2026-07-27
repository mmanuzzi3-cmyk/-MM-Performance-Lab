-- Esegui questo codice una sola volta nel SQL Editor di Supabase
create table if not exists public.mmpl_state (
  workspace_id text primary key,
  payload jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.mmpl_state enable row level security;

-- Versione personale semplice: consente all'app con anon key di leggere/scrivere.
-- Usa un codice archivio lungo e non condiviso.
create policy "mmpl anon read" on public.mmpl_state for select to anon using (true);
create policy "mmpl anon insert" on public.mmpl_state for insert to anon with check (true);
create policy "mmpl anon update" on public.mmpl_state for update to anon using (true) with check (true);
