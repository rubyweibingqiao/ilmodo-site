-- Skin intake form submitted from /skin-profile before a client's first visit.
-- Row level security: the public site may insert, never read.
create table public.intake_forms (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz default now(),
  full_name text not null,
  date_of_birth date,
  email text,
  phone text,
  medical_history text[] default '{}',
  medical_other text,
  current_medication text,
  current_treatments text,
  previous_treatments text,
  products_used text,
  diet_fluids text,
  skin_type text,
  concerns text,
  consent_accurate boolean default false
);
alter table public.intake_forms enable row level security;
create policy "anyone can submit an intake form" on public.intake_forms
  for insert to anon, authenticated with check (true);
