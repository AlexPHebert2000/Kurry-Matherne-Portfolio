<script lang="ts">
  import type { PageData } from './$types';
  import UpdateCard from '../components/UpdateCard.svelte';
  import BookCarousel from '../components/BookCarousel.svelte';
  export let data: PageData
</script>

<div class="flex justify-center flex-col px-5 p-20">
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
  <div class="flex flex-row justify-evenly">
    <a href="/gallery/art">
      <button class="w-36 h-12 bg-slate-400 rounded-full font-bold">
        Art Gallery
      </button>09:40 AM
    </a>
    <button class="w-36 bg-slate-400 rounded-full font-bold">Comics</button>
  </div>
  <div>
    <h1>Latest Works!</h1>
    <BookCarousel books={data.books}/>
  </div>
</div>