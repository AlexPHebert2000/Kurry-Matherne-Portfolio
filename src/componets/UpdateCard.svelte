<script lang="ts">
  import type { Update } from "@prisma/client";
  import dayjs from 'dayjs';

  export let update : Update;
</script>

<div class="bg-slate-900 bor text-white rounded-md mb-3 p-2">
  <div class="flex justify-between">
    <h1 class="font-semibold text-lg">{update.title}</h1>
    <h1>{dayjs(update.createdAt).format("DD/MM/YYYY")}</h1>
  </div>
  <p>{update.body}</p>
</div>