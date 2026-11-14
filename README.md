<p align="center"><img src="site/brandassets/logo-full.png" alt="ilmodo mobile facials" width="320"></p>

# ilmodo: mobile facial studio website

Source code for **[ilmodobeauty.com](https://ilmodobeauty.com)**, the website of ilmodo, a mobile facial studio in Houston, Texas. I designed, built and run this site for my own business, using Claude as a coding partner.

## What the site does

- Presents three offerings (il ritmo, il momento and the il modo membership) with clear pricing and travel fees
- Takes bookings with a deposit through Square Appointments
- Sells eGift cards through Square
- Collects a skin intake form before a client's first visit ([/skin-profile](https://ilmodobeauty.com/skin-profile)), saved straight to a Postgres database
- Runs a referral and partner program with an application form ([/referrals](https://ilmodobeauty.com/referrals))

## How it's built

| Layer | Choice | Why |
|---|---|---|
| Front end | Hand-written HTML, CSS and vanilla JavaScript, no framework | Loads fast on a phone, nothing to update or patch |
| Hosting | Netlify, deployed automatically on every push to `main` | Free SSL, custom domain, security headers set in `netlify.toml` |
| Data | Supabase (Postgres) with row level security | The public site can submit forms but can never read client records |
| Booking and payments | Square Appointments and Square eGift cards | Card data never touches this site |

## Repository layout

```
site/                    the website Netlify publishes
  index.html             home page: services, method, service area, FAQ
  referrals.html         referral and partner program
  skin-profile.html      client skin intake form
  assets/                photography
  brandassets/           logos
supabase/migrations/     database tables and access rules
netlify.toml             publish folder and security headers
```

## Privacy and security

- The Supabase key in the pages is the public "publishable" key. Row level security limits it to inserting new rows. Reading data requires credentials that never leave the Supabase dashboard.
- The intake form collects health-related information, so its table has no public read access at all.
- Security headers (frame, content-type, referrer and HSTS policies) are set for every page in `netlify.toml`.

## Run it locally

It's a static site, so any static file server works:

```bash
npx serve site
```

## About me

I'm **Ruby Wei**, founder of ilmodo. Before starting it I spent about three and a half years as a management consultant at Protiviti, working on ESG reporting, greenhouse gas accounting and post-merger integration for Fortune 100 clients. I hold a B.S. in Finance from Texas A&M, the CIDESCO Skin Care Diploma and a Texas esthetician license.

I'm open to roles in venture capital, climate tech and operations at early-stage companies.

- Website: [ilmodobeauty.com](https://ilmodobeauty.com)
- Email: [rubywei@ilmodobeauty.com](mailto:rubywei@ilmodobeauty.com)
