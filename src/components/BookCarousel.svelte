<script lang="ts">
  import BookCarouselCard from './BookCarouselCard.svelte';
  import type {Book} from '@prisma/client';

  export let books : Book[];

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

<div class="flex flex-1 justify-center">
  <div class="flex flex-row">
    <button on:click={() => {scroll(false)}}>{"<"}</button>
    <div class="ease-in-out">
      <BookCarouselCard book={books[currentIndex]}/>
    </div>
    <button on:click={() => scroll()}>{">"}</button>
  </div>
</div>
