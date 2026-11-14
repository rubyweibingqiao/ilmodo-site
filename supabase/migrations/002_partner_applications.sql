-- Referral partner applications submitted from /referrals.
-- Row level security: the public site may insert, never read.
create table public.partner_applications (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  full_name text not null,
  email text not null,
  phone text,
  partner_type text not null,
  handle_or_business text,
  audience_location text,
  how_you_would_refer text,
  agreed_to_terms boolean not null default false,
  status text not null default 'new'
);
alter table public.partner_applications enable row level security;
create policy "anyone can submit a partner application" on public.partner_applications
  for insert to anon, authenticated with check (true);
