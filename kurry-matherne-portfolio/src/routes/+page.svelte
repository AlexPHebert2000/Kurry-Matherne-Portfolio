<script lang="ts">
  import type { PageData } from './$types';
  import UpdateCard from '../componets/UpdateCard.svelte';
  export let data: PageData
</script>

<div class="flex justify-center flex-col p-20">
  <div class="flex flex-row py-3 space-x-2">
    <img class="lg:w-60 md:w-32 w-28" src={data.info.headShotUrl} alt="Kurry Matherne"/>
    <div>
      <h1 class="text-xl font-bold">About Me</h1>
      <p>{data.info.aboutMe}</p>
    </div>
  </div>
  {#each data.updates as update}
    <UpdateCard update={update}/>
  {/each}
</div>