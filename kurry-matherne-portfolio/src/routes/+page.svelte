<script lang="ts">
  import type { PageData } from './$types';
  export let data: PageData
</script>

<div>
  <h1>Test</h1>
  {#each data.feed as update}
    <h1>{update.title}</h1>
    <p>{update.body}</p>
  {/each}
</div>