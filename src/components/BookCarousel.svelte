<script lang="ts">
  import BookCarouselCard from './BookCarouselCard.svelte';
  import type { WorkWithImages } from "../../types"

  export let books : WorkWithImages[];

  let currentIndex = 0;
  const scroll = (forward = true) => {
    currentIndex += (forward ? 1 : -1);
    if (currentIndex >= books.length) {
      currentIndex = 0;
    }
    else if (currentIndex < 0) {
      currentIndex = books.length - 1;
    }
  }
</script>

<div class="flex flex-1">
  <div class="flex flex-row items-center">
    <button class="-mr-5 z-10 rounded-full text-white w-10 h-10 bg-black/50" on:click={() => {scroll(false)}}>{"<"}</button>
    <div class="ease-in-out">
      <BookCarouselCard book={books[currentIndex]}/>
    </div>
    <button class="-ml-5 rounded-full text-white w-10 h-10 bg-black/50" on:click={() => scroll()}>{">"}</button>
  </div>
</div>
