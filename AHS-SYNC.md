# AHS Voice Platform — fork sync (white-labeled Dograh)

Fork: https://github.com/dmota142839/dograh  (remote: origin)
Upstream: https://github.com/dograh-hq/dograh  (remote: upstream)

This is a self-hosted, BSD-2-Clause white-label. LICENSE/attribution preserved.
Your customizations live on `main`; pull upstream updates with the script below.

## Pull latest upstream changes (keep your edits)
    ./ahs-update.sh
which runs:
    git fetch upstream
    git merge upstream/main      # resolve conflicts (compose/Dockerfile/ui likely)
    docker compose build ui      # rebuild white-labeled UI
    docker compose up -d
    git push origin main         # save merged state to your fork

## Conflict hot-spots (expect these on upstream merges)
- docker-compose.yaml  (AHS infra: Traefik labels, coturn, ari-tunnel, networks)
- ui/Dockerfile        (chatwoot blanked, local build)
- ui/src branding files (layout/sidebar/header/overview/footer/GitHubStarBadge)
Keep the AHS side for branding/infra; take upstream for feature code.

## NEVER committed (gitignored): secrets/, _handoff-backups/, certs/, .env, *.bak
Wazo ARI key lives in secrets/wazo_ari_key (local only).

## Separate from this fork (patch manually if re-cloned):
- voice-stack/chatterbox  (pcm response_format patch — own dir, not this repo)
- Wazo /etc/asterisk drop-ins (ari.d/dograh.conf, websocket_client.conf, extensions_extra.d/)
- dograh DB rows (telephony config, phone numbers, workflow tool attachments, user_configurations)
